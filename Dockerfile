FROM ubuntu:20.04

# Optional: Prevents some prompts with tzdata
ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 80 443 3000 22

# Optional: Update the software repository and install any updates
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git-core sudo nano curl wget locales ufw
RUN git clone https://github.com/dCC-Online/dcc-lms-scripts.git
