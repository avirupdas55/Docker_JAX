# JAX Docker Image with CUDA 12.1 Support

![JAX Logo](https://jax.readthedocs.io/en/latest/_static/jax_logo_250px.png)

## Overview

This repository contains build scripts for creating a Docker image that enables running JAX with CUDA 12.1 support. The pre-built image is available on Docker Hub with the default tag `avirupdas55/jax:v1`.

## Getting Started

To use the pre-built Docker image with the default tag, simply pull it from Docker Hub:

```bash
docker pull avirupdas55/jax:v1
```


If you prefer to build the image locally using the provided build script, follow the steps below.

### Building the Docker Image Locally

1. Clone this repository:

```bash
git clone https://github.com/agent-lab/JAX_Docker.git
```

2. Navigate to the repository:

```bash
cd JAX_Docker
```

3. Run the build script with optional arguments for custom tag and Docker Hub ID:

```bash
bash docker_build.sh custom-tag your-docker-id
```

Replace `custom-tag` with the desired tag name and `your-docker-id` with your Docker Hub ID. If no arguments are provided, the default tag `avirupdas55/jax:v1` will be used.


## Running JAX in the Docker Container

Once you have the Docker image, you can run JAX scripts inside a container. Use the following command to start a container:

```bash
docker run -it --gpus all avirupdas55/jax:v1
```

This command will launch a container with access to all GPUs.

## Starting a Jupyter Notebook Kernel

You can also start a Jupyter notebook kernel inside the Docker container. Use the following command:

```bash
jupyter-notebook --ip='0.0.0.0' --port=8888 --no-browser --allow-root --NotebookApp.allow_origin='*'
```

## Example Usage

You can run JAX scripts within the Docker container. For example:

```bash
docker run -it --gpus all avirupdas55/jax:v1 python my_jax_script.py
```

Replace `my_jax_script.py` with the name of your JAX script.

## Using with Singularity

To use the Docker image with Singularity, follow these steps:

1. Run JAX script in the Singularity container:

```bash
singularity exec --nv docker://avirupdas55/jax:v1 python my_jax_script.py
```

Replace `my_jax_script.py` with the name of your JAX script.

## Additional Information

- This Docker image includes JAX with CUDA 12.1 support.
- The default Docker image tag is `avirupdas55/jax:v1`.
- For more information about JAX, refer to the [official JAX documentation](https://jax.readthedocs.io/en/latest/).
- For CUDA documentation, visit the [NVIDIA CUDA Toolkit documentation](https://docs.nvidia.com/cuda/index.html).

Feel free to customise the Dockerfile, build script, and repository to suit your specific requirements.

Happy coding with JAX! 🚀