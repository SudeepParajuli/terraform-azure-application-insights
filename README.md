# Azure Application Insights

Terraform module for deploying Azure Application Insights.

![Resource Group](https://tinyurl.com/y5atu338)

**Application Insights**, a feature of Azure Monitor, is an extensible
Application Performance Management (APM) service for developers and DevOps
professionals. Use it to monitor your live applications. It will automatically
detect performance anomalies, and includes powerful analytics tools to help you
diagnose issues and to understand what users actually do with your app. It's
designed to help you continuously improve performance and usability. It works
for apps on a wide variety of platforms including .NET, Node.js, Java, and
Python hosted on-premises, hybrid, or any public cloud. It integrates with your
DevOps process, and has connection points to a variety of development tools. It
can monitor and analyze telemetry from mobile apps by integrating with Visual
Studio App Center.

![Resource Group Architecture](https://tinyurl.com/y3jgwepb)

# Usage

You can find an example on how to incorporate this module in your project under
[examples](https://tinyurl.com/y5smzqps).

The examples consist of the following files:

- `backend.tf:` configuration for using remote azurerm backend.
- `environments:` tfvars file for dev, qa and prod environment.
- `main.tf:` the main file with the application insights module.
- `variables.tf:` definition of expected input variables.

# License

This repository is licensed under the **GNU General Public License v3.0** - see
the [LICENSE](https://tinyurl.com/yxbn5lry) file for details.

# Acknowledgments

[Application Insights Overview](https://tinyurl.com/yymkuo4b)
