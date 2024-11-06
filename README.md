# Last click attribution variable
## Sumary
This Google Tag Manager variable template stores the last valid "last click" attribution value and persists it for use across pages. It enables cross-session tracking of attribution data, capturing the values of `utm_source` and `utm_medium` parameters based on custom settings.
## Configuration

1. **Input Table Fields**:
   - The template includes a configuration table where each row represents a unique `utm_source` and `utm_medium` pair to be evaluated for last-click attribution:
     - **Attribution**: This field specifies the name that will be used as the return value of the variable. It can be the same as `utm_source` or a custom label to represent the source.
     - **utm_source**: The specific source (e.g., "google", "facebook") relevant to this attribution pair.
     - **utm_medium**: The specific medium (e.g., "cpc", "email") that works in conjunction with `utm_source` in this pair.

2. **Evaluation Process**:
   - Only filled-in rows are used for attribution evaluation. The template will evaluate each row and store the corresponding `Attribution` name when a matching `utm_source` and `utm_medium` are detected.
   - This `Attribution` value is then saved and persists across sessions.

3. **Persistence Settings**:
   - The template stores the last valid attribution name in local storage, ensuring the attribution persists across pages and sessions.

### Example Configuration

| Attribution | utm_source       | utm_medium      |
|-------------|------------------|-----------------|
| Google Ads  | google           | cpc            |
| Facebook    | facebook         | cpc            |
| Newsletter  | newsletter       | email          |
| LinkedIn    | linkedin         | social         |

In this example, each row defines a custom `Attribution` name that will be stored if the corresponding `utm_source` and `utm_medium` are detected. The value in the `Attribution` field (e.g., "Google Ads", "Facebook") is what will be returned by the variable and will persist for future page views and sessions.
