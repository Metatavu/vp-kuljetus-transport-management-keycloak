FROM quay.io/keycloak/keycloak:24.0.1 as builder

WORKDIR /opt/keycloak
RUN curl "https://maven.pkg.github.com/Metatavu/vp-kuljetus-transport-management-driver-card-keycloak-auth-provider/fi/metatavu/vp/keycloak/vp-kuljetus-transport-management-driver-card-keycloak-auth-provider/1.0.0/vp-kuljetus-transport-management-driver-card-keycloak-auth-provider-1.0.0.jar" -o /opt/keycloak/providers/driver-card-keycloak-auth-provider-1.0.0.jar
ENV KC_DB=mysql

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:24.0.1
ENV KC_DB=mysql
COPY --from=builder /opt/keycloak/ /opt/keycloak/