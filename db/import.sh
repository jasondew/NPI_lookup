mysql -u root -p npi_lookup_development -e "TRUNCATE TABLE providers"
mysqlimport -u root -p --columns="npi, entity_type_code, replacement_npi, ein, organization_name, last_name, first_name, middle_name, name_prefix, name_suffix, credentials, other_organization_name, other_organization_name_type, other_last_name_type, mailing_street_1, mailing_street_2, mailing_city, mailing_state, mailing_postal_code, mailing_country_code, mailing_phone_number, mailing_fax_number, practice_street_1, practice_street_2, practice_city, practice_state, practice_postal_code, practice_country_code, practice_phone_number, practice_fax_number, enumeration_date, update_date, deactivation_reason, deactivation_date, reactivation_date, gender, authorized_official_last_name, authorized_official_first_name, authorized_official_middle_name, authorized_official_title, authorized_phone_number, taxonomy_1, license_number_1, license_number_state_1, primary_taxonomy_switch_1, taxonomy_2, license_number_2, license_number_state_2, primary_taxonomy_switch_2, taxonomy_3, license_number_3, license_number_state_3, primary_taxonomy_switch_3, taxonomy_4, license_number_4, license_number_state_4, primary_taxonomy_switch_4, taxonomy_5, license_number_5, license_number_state_5, primary_taxonomy_switch_5, taxonomy_6, license_number_6, license_number_state_6, primary_taxonomy_switch_6, taxonomy_7, license_number_7, license_number_state_7, primary_taxonomy_switch_7, taxonomy_8, license_number_8, license_number_state_8, primary_taxonomy_switch_8, taxonomy_9, license_number_9, license_number_state_9, primary_taxonomy_switch_9, taxonomy_10, license_number_10, license_number_state_10, primary_taxonomy_switch_10, taxonomy_11, license_number_11, license_number_state_11, primary_taxonomy_switch_11, taxonomy_12, license_number_12, license_number_state_12, primary_taxonomy_switch_12, taxonomy_13, license_number_13, license_number_state_13, primary_taxonomy_switch_13, taxonomy_14, license_number_14, license_number_state_14, primary_taxonomy_switch_14, taxonomy_15, license_number_15, license_number_state_15, primary_taxonomy_switch_15, identifier_1, identifier_type_1, identifier_state_1, identifier_issuer_1, identifier_2, identifier_type_2, identifier_state_2, identifier_issuer_2, identifier_3, identifier_type_3, identifier_state_3, identifier_issuer_3, identifier_4, identifier_type_4, identifier_state_4, identifier_issuer_4, identifier_5, identifier_type_5, identifier_state_5, identifier_issuer_5, identifier_6, identifier_type_6, identifier_state_6, identifier_issuer_6, identifier_7, identifier_type_7, identifier_state_7, identifier_issuer_7, identifier_8, identifier_type_8, identifier_state_8, identifier_issuer_8, identifier_9, identifier_type_9, identifier_state_9, identifier_issuer_9, identifier_10, identifier_type_10, identifier_state_10, identifier_issuer_10, identifier_11, identifier_type_11, identifier_state_11, identifier_issuer_11, identifier_12, identifier_type_12, identifier_state_12, identifier_issuer_12, identifier_13, identifier_type_13, identifier_state_13, identifier_issuer_13, identifier_14, identifier_type_14, identifier_state_14, identifier_issuer_14, identifier_15, identifier_type_15, identifier_state_15, identifier_issuer_15, identifier_16, identifier_type_16, identifier_state_16, identifier_issuer_16, identifier_17, identifier_type_17, identifier_state_17, identifier_issuer_17, identifier_18, identifier_type_18, identifier_state_18, identifier_issuer_18, identifier_19, identifier_type_19, identifier_state_19, identifier_issuer_19, identifier_20, identifier_type_20, identifier_state_20, identifier_issuer_20, identifier_21, identifier_type_21, identifier_state_21, identifier_issuer_21, identifier_22, identifier_type_22, identifier_state_22, identifier_issuer_22, identifier_23, identifier_type_23, identifier_state_23, identifier_issuer_23, identifier_24, identifier_type_24, identifier_state_24, identifier_issuer_24, identifier_25, identifier_type_25, identifier_state_25, identifier_issuer_25, identifier_26, identifier_type_26, identifier_state_26, identifier_issuer_26, identifier_27, identifier_type_27, identifier_state_27, identifier_issuer_27, identifier_28, identifier_type_28, identifier_state_28, identifier_issuer_28, identifier_29, identifier_type_29, identifier_state_29, identifier_issuer_29, identifier_30, identifier_type_30, identifier_state_30, identifier_issuer_30, identifier_31, identifier_type_31, identifier_state_31, identifier_issuer_31, identifier_32, identifier_type_32, identifier_state_32, identifier_issuer_32, identifier_33, identifier_type_33, identifier_state_33, identifier_issuer_33, identifier_34, identifier_type_34, identifier_state_34, identifier_issuer_34, identifier_35, identifier_type_35, identifier_state_35, identifier_issuer_35, identifier_36, identifier_type_36, identifier_state_36, identifier_issuer_36, identifier_37, identifier_type_37, identifier_state_37, identifier_issuer_37, identifier_38, identifier_type_38, identifier_state_38, identifier_issuer_38, identifier_39, identifier_type_39, identifier_state_39, identifier_issuer_39, identifier_40, identifier_type_40, identifier_state_40, identifier_issuer_40, identifier_41, identifier_type_41, identifier_state_41, identifier_issuer_41, identifier_42, identifier_type_42, identifier_state_42, identifier_issuer_42, identifier_43, identifier_type_43, identifier_state_43, identifier_issuer_43, identifier_44, identifier_type_44, identifier_state_44, identifier_issuer_44, identifier_45, identifier_type_45, identifier_state_45, identifier_issuer_45, identifier_46, identifier_type_46, identifier_state_46, identifier_issuer_46, identifier_47, identifier_type_47, identifier_state_47, identifier_issuer_47, identifier_48, identifier_type_48, identifier_state_48, identifier_issuer_48, identifier_49, identifier_type_49, identifier_state_49, identifier_issuer_49, identifier_50, identifier_type_50, identifier_state_50, identifier_issuer_50, sole_proprietor, organization_subpart, parent_organization_lbn, parent_organization_tin, authorized_official_prefix, authorized_official_suffix, authorized_official_credentials" --ignore-lines=1 --fields-terminated-by=',' --fields-enclosed-by='"' --fields-escaped-by='\\' --lines-terminated-by='\n' --local npi_lookup_development providers.csv 
