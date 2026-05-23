FROM mysql:oraclelinux9

COPY --chmod=755 <<"HEALTHCHECK_SCRIPT" /usr/local/bin/healthcheck.sh
#!/bin/bash
mysqladmin ping -h localhost --silent
HEALTHCHECK_SCRIPT

HEALTHCHECK --interval=15s --timeout=5s --retries=5 \
  CMD ["/usr/local/bin/healthcheck.sh"]

EXPOSE 3306
