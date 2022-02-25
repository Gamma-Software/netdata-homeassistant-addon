# Home Assistant Add-on: Netdata add-on

## How to use

Netdata will allow you to monitor your HomeAssistant instance. It's fast and is optimized.

It's a web based interface like a dashboard and you should be able to access it via your HomeAssistant instance.

## Example

Here is an example of the dashboard ![netdata charts](https://www.netdata.cloud/wp-content/uploads/2021/05/overview-20210521-2.png)

## Configuration

- **hostname**: Give a name to your Netdata instance
- **page_cache_size**: give a size of the page cache. This is optionnal and the default value should be enough. If you want to optimize the performance you can check the [Netdata documentation](https://learn.netdata.cloud/docs/store/change-metrics-storage#calculate-the-system-resources-ram-disk-space-needed-to-store-metrics)
- **dbengine_disk_space**: give a max size of the database. This is optionnal and the default value should be enough. If you want to optimize the performance you can check the [Netdata documentation](https://learn.netdata.cloud/docs/store/change-metrics-storage#calculate-the-system-resources-ram-disk-space-needed-to-store-metrics)
- **enable_alarm**: enable the thresholds alarm
- **enable_log**: enable the logs
