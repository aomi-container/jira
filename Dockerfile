##
# Jira
##

FROM aomitech/server-jre:1.8.0_271 as builder

WORKDIR /app

COPY atlassian-jira-software-8.17.1-standalone/ /app

FROM aomitech/server-jre:1.8.0_271 

ENV JIRA_HOME=/jira

COPY --from=builder app /app

RUN mkdir ${JIRA_HOME}

VOLUME [ "${JIRA_HOME}" ]
WORKDIR ${JIRA_HOME}

CMD [ "/app/bin/start-jira.sh", "run"]
