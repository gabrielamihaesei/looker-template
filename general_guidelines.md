# Looker Template
Looker project files for Operations

# 🏠 General Guidelines
The main guidelines have been included in below;

## 🏗️ Folder Structure Guidelines

### 🗄️ High-level Folder Structure
Here is the high-level folder structure for the Spoke LookML objects

Folder Name: base_views
Function: Curated base views defining as-a-minimum transformations to views. The base views contain spoke specific views

Folder Name: composite_modelling
Function: Refinements for base or imported hub views which are required in some or all of the explores, based on use cases

Folder Name: common_refinements
Function: Refinements for either the hub views or the spoke-specific views which are built on top of existing dimensions and measure and re-used in multiple explores

Folder Name: derived_tables
Function: Native and SQL derived tables, separated into folders for persistent and non-persistent

Folder Name: explores
Function: The explores defined for the spoke

# LookML Development Guidelines
## 🏠 General LookML
- Ensure no errors and clean content validator when pushing code to production
- Use explicit includes for view and explore files - do not use wildcards (*)
- Structure files into folders
- Use the ‘label’ and ‘group_label’ parameters to apply business-friendly names (where business-friendly names do not exist for fields, views or explores)
- Add descriptions to provide more information to the end user
- Use lowercase letters and underscores for spaces in all LookML objects
- Use sets to define a group of fields centrally and use for drill_fields and fields
- Do not create too many views/explores/dimensions for first pass (start simple and expand later)

## 🔎 Views
Ensure all views have a primary key, that is unique
Create a dimension for all columns in your table, and ensure you reference the Looker dimension when using in other fields (using the substitution operators), for example:

    dimension: user_id {
      type: number
      sql: ${TABLE}.user_id ;; # Point to underlying table in the column
    }

    measure: number_of_users_this_week {
      type: count_distinct
      sql: ${user_id} ;;       # Using ${field_name} to reference the LookML field `user_id`
      filters: [created_at_date: "7 days"]
    }

- Ensure the file name and view name are the same
- One view per view file, unless the second view is the result of unnesting a column
- Hide dimensions and measures that do not need to be surfaced to the end user
- Group fields within the LookML, to make developing LookML as simple as possible for other developers and admins – Group fields into (1) templated filters & parameters, (2) columns from the table, (3) custom dimensions, (4) custom measures, (5) sets
- Ensure all date fields are dimension_groups, rather than dimensions
- For PDTs, use datagroups and 'datagroup_trigger' over 'persist_for'

## 🧭 Explores
- Create individual .explore files for each explore. Include these in the relevant model
- Choose ‘view_name’ over ‘from’, unless the view is being joined in the explore multiple times
- Ensure ‘type’, ‘sql_on’ and ‘relationship’ are defined for joins
- Use many_to_one joins where possible
- Use _amended timeframe for joins
- Hide explores that do not need to be surfaced to the end user. For example, if the explore is used for a specific Look or tile

## 📜 Manifest file
- Define custom formats and other constants centrally in a Manifest file
