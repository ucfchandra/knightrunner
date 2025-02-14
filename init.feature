Feature: initialize knightrunner by installing prerequisites and checking credential validity
		In order to run `knightrunner apply` and spin up the infrastructure
		As an appfolio admin
		I need to have relevant packages installed and valid credentials set

		Scenario: I run `knightrunner init` without network access
				Given I do not have network access
				When I run `knightrunner init`
				Then I timeout in `10s`

		Scenario: I run `knightrunner init` with network access but without correct AWS credentials
				Given I have network access
				But I have incorrect AWS credentials
				When I write `knightrunner init`
				Then I log that valid AWS credentials aren't stored

		Scenario: I run `knightrunner init` with network access and with correct AWS credentials
				Given I have network access
				And I have correct AWS credentails
				When I write `knightrunner init`
				Then I log that valid AWS credentials are stored
		
		Scenario Outline: I run `knightrunner init` with network access to check prerequisite installs
				Given I have network access 
				And the prerequisite <package>
				And this package is <installedState>
				When I run `knightrunner init`
				Then I log `<package> is installed`

				Examples:
					| package | installedState |
					| opentofu | installed |
					| opentofu | uninstalled |
					| terragrunt | installed |
					| terragrunt | uninstalled |
					| podman | installed |
					| podman | uninstalled | 
					| mysql-client | installed |
					| mysql-client | uninstalled |
					| aws | installed |
					| aws | uninstalled |

				





