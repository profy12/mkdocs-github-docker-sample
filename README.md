# mkdocs-github-docker-sample
Just a sample with github workflow to build Docker image

## Build image to work locally

```
docker build --target dev -t madoc-dev .
docker run -d -p 8080:8000 --mount type=bind,source="$(pwd)",target=/app madoc
```

Edit file locally and view render on http://localhost:8080

