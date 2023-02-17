FROM linux:8.6

COPY run.sh /usr/local/bin/run.sh
COPY OCI-AutoScale /root/OCI-AutoScale
COPY .oci /root/.oci/
COPY autoscale /etc/cron.d/autoscale

RUN yum update -yq && \
  yum install git cron python3 python3-pip curl nano -yq && \
  pip3 install oci oci-cli && \
  chmod +x /usr/local/bin/run.sh && \
  mkdir -p /var/log/oci-autoscale
CMD ["cron", "-f"]
