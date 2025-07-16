# DevOps Project

This project demonstrates a simple Python Flask application containerized with Docker and deployed using Terraform.

## Key Features & Benefits

*   **Containerization:** The application is packaged using Docker for consistent execution across different environments.
*   **Infrastructure as Code (IaC):** Terraform is used to provision and manage the infrastructure required for deployment.
*   **Simple Web Application:**  A basic "Hello World" Flask application serves as a starting point.
*   **Remote State Management:**  Terraform state is stored remotely for collaboration and consistency.
*   **Continuous Integration:** A Jenkinsfile is provided for potential integration with a CI/CD pipeline.

## Prerequisites & Dependencies

Before you begin, ensure you have the following installed:

*   **Docker:**  [https://www.docker.com/get-started](https://www.docker.com/get-started)
*   **Python 3.9+:** [https://www.python.org/downloads/](https://www.python.org/downloads/)
*   **Terraform:** [https://www.terraform.io/downloads](https://www.terraform.io/downloads)
*   **AWS CLI:** [https://aws.amazon.com/cli/](https://aws.amazon.com/cli/) (configured with appropriate credentials)

## Installation & Setup Instructions

1.  **Clone the repository:**

    ```bash
    git clone <repository_url>
    cd devops-project
    ```

2.  **Build the Docker image:**

    ```bash
    docker build -t devops-app .
    ```

3.  **Run the Docker container (optional - for local testing):**

    ```bash
    docker run -p 5000:5000 devops-app
    ```

    Visit `http://localhost:5000` in your browser to see the application.

4.  **Initialize Terraform:**

    ```bash
    cd Terraform
    ./install-dependencies.sh
    terraform init -backend-config="Remote-backend/s3.tf" -reconfigure
    ```

    *Note: You need to setup s3 bucket and dynamo db as specified in `Terraform/Remote-backend` folder. Please check the documentation [here](https://www.terraform.io/language/settings/backends/s3).*
    *   Ensure you have an AWS S3 bucket and DynamoDB table configured for Terraform remote state management as defined in `Terraform/Remote-backend/s3.tf` and `Terraform/Remote-backend/dynamodb.tf`.  Replace the placeholder values in these files with your actual bucket name and DynamoDB table name.
    *   AWS Credentials must be properly configured using `aws configure`.

5. **Apply Terraform Configuration:**

   ```bash
   terraform apply
   ```

   Confirm the changes by typing `yes` when prompted. Terraform will provision the infrastructure on AWS.

## Usage Examples & API Documentation

The application exposes a single endpoint at the root path (`/`).

*   **Endpoint:** `/`
*   **Method:** GET
*   **Response:** `"Hello bhai from Docker on AWS!"`

After deploying the infrastructure with Terraform, you can access the application at the public IP address of the EC2 instance created.  The public IP address will be displayed in the Terraform output.

## Configuration Options

*   **`app.py`:**  The Flask application code can be modified to implement custom logic.
*   **`Dockerfile`:**  Customize the Docker image build process by modifying the `Dockerfile`.
*   **`terraform.tfvars`:**  (Not included, but recommended) Define variables such as instance type, region, and security group rules in a `terraform.tfvars` file to avoid hardcoding them in the Terraform files. This is best practice.
*   **Terraform Variables:**  Adjust variables defined in `main.tf` as needed to customize the infrastructure (e.g., instance type, AMI). Remember to update the variables in `terraform.tfvars` file or through `-var` option.

## Contributing Guidelines

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Make your changes and commit them with descriptive messages.
4.  Submit a pull request.

## License Information

[//]: # (Add the License section)

## Acknowledgments

*   This project utilizes the following open-source software:
    *   Python
    *   Flask
    *   Docker
    *   Terraform