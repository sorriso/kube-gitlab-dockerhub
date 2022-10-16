ARG ARG_GITLAB_VERSION

FROM gitlab/gitlab-ce:${ARG_GITLAB_VERSION}

RUN set -eux \
    && usermod -a -G root git \
    && chown -R git:0 /etc/gitlab \
    && chmod -R 0755 /etc/gitlab
