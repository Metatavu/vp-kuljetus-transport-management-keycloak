FROM quay.io/keycloak/keycloak:24.0.1 as builder
WORKDIR /opt/keycloak
ADD providers /opt/keycloak/providers
ENV KC_DB=mysql
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:24.0.1
ENV KC_DB=mysql
COPY --from=builder /opt/keycloak/ /opt/keycloak/