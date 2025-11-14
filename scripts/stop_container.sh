#!/bin/bash
docker stop new-web-app || true
docker rm new-web-app || true
