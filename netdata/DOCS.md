# Configuration

- **hostname**: Give a name to your Netdata instance
- **page_cache_size**: give a size of the page cache. This is optionnal and the default value should be enough. If you want to optimize the performance you can check the [Netdata documentation](https://learn.netdata.cloud/docs/store/change-metrics-storage#calculate-the-system-resources-ram-disk-space-needed-to-store-metrics)
- **dbengine_disk_space**: give a max size of the database. This is optionnal and the default value should be enough. If you want to optimize the performance you can check the [Netdata documentation](https://learn.netdata.cloud/docs/store/change-metrics-storage#calculate-the-system-resources-ram-disk-space-needed-to-store-metrics)
- **enable_alarm**: enable the thresholds alarm
- **enable_log**: enable the logs

## Cloud Netdata configuration

To automatically claim nodes after installation:

Sign in to Netdata Cloud

1. Go to the Spaces management area
2. Click on Connect Nodes
3. Find the token and rooms strings and specify your nodes:

- **claim_token**: Specify a unique claiming token associated with your Space in Netdata Cloud to be used to connect to the node after the install.
- **claim_rooms**: Specify a comma-separated list of tokens for each War Room this node should appear in.
- **cloud_url**: Specify a URL to use when connecting to the cloud. Defaults to https://app.netdata.cloud.
