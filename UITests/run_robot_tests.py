"""
This script runs Robot Framework test suites with both common and test-specific variables.
Each test suite is mapped to its own argument dictionary, ensuring each runs only once with the correct parameters.
"""

import subprocess
import os

# Get the directory of this script
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))

# Common variables for all test runs
BASE_ARGUMENTS = {
    "BROWSER": "chrome",
    "SCREEN_WIDTH": "2560",
    "SCREEN_HEIGHT": "1600",
    "ENV": "test",
    "USERNAME": "akshay+test@skysql.com",
    "PASSWORD": "Test@123",
    "PROVIDER": "aws",
    "REGION": "us-east-2"
    # Add more common arguments as needed
}

# Map each test suite to its specific arguments
TEST_SUITES_WITH_ARGS = [
    {
        "path": os.path.join(SCRIPT_DIR, "Tests", "CustomerPortalTests", "ServiceDetailsTests", "ServiceDetails.robot"),
        
    },
    {
        "path": os.path.join(SCRIPT_DIR, "Tests", "CustomerPortalTests", "SkyAITests", "SkyAIPrompts.robot"),
        
    },
    {
        "path": os.path.join(SCRIPT_DIR, "Tests", "CustomerPortalTests", "LaunchTopologyTests", "LaunchTopologyCRUD.robot"),
        "test_vars": {"TYPE": "Provisioned", "TOPOLOGY": "Replica", "USE_DEFAULT_NAME": True}
    },
    {
        "path": os.path.join(SCRIPT_DIR, "Tests", "CustomerPortalTests", "LaunchTopologyTests", "LaunchTopologyServerlessCRUD.robot"),
        "test_vars": {"TYPE": "Serverless", "TOPOLOGY":"Serverless", "USE_DEFAULT_NAME": False}
    }
    # Add more suites and their specific arguments as needed
]

test_results = []

def run_robot_tests():
    for suite in TEST_SUITES_WITH_ARGS:
        suite_path = suite["path"] # path is our key in the TEST_SUITES_WITH_ARGS
        test_vars = suite.get("test_vars", {}) # Ensures those test suites don't have test_vars will not fail
        print(f"\n📂 Running test on suite: {suite_path}")

        # Merge base and test-specific variables
        merged_vars = {**BASE_ARGUMENTS, **test_vars}

        # Build the robot command
        cmd = ["robot"]
        for key, value in merged_vars.items():
            cmd.extend(["--variable", f"{key}:{value}"])
        cmd.append(suite_path)

        # Execute the command
        result = subprocess.run(cmd)

        if result.returncode != 0:
            print(f"❌ Test on {suite_path} FAILED with exit code {result.returncode}")
            test_results.append((suite_path, "FAILED"))
        else:
            print(f"✅ Test on {suite_path} PASSED")
            test_results.append((suite_path, "PASSED"))

    print("\nTest Results Summary:")
    for suite_path, status in test_results:
        print(f"{suite_path}: {status}")

if __name__ == "__main__":
    run_robot_tests()