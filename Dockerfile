FROM ubuntu
MAINTAINER admin

EXPOSE 137
EXPOSE 138
EXPOSE 139
EXPOSE 445

RUN apt update
RUN apt install -y samba
RUN useradd -m samba
RUN yes "samba" | pdbedit -a samba -t
RUN echo '[share]' >> /etc/samba/smb.conf
RUN echo 'comment = Share' >> /etc/samba/smb.conf
RUN echo 'path = /home/samba' >> /etc/samba/smb.conf
RUN echo 'read only = no' >> /etc/samba/smb.conf
RUN echo 'guest only = no' >> /etc/samba/smb.conf
RUN echo 'guest ok = yes' >> /etc/samba/smb.conf
RUN echo 'force user = samba' >> /etc/samba/smb.conf

CMD service smbd start && service nmbd start && bash
