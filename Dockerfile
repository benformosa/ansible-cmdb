FROM python:3-alpine
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
RUN python setup.py install

# create a file to overwrite with a single-file volume
RUN touch /tmp/inventory

ENTRYPOINT ["ansible-cmdb"]
