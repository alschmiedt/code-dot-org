Sequel.migration do
  up do
    user_storage_ids_pegasus = "#{CDO.pegasus_db_name}__user_storage_ids".to_sym
    user_storage_ids_dashboard = "#{CDO.dashboard_db_name}__user_storage_ids".to_sym
    rename_table(user_storage_ids_pegasus, user_storage_ids_dashboard)
    DCDO.set('user_storage_ids_in_dashboard', true)
  end

  down do
    user_storage_ids_pegasus = "#{CDO.pegasus_db_name}__user_storage_ids".to_sym
    user_storage_ids_dashboard = "#{CDO.dashboard_db_name}__user_storage_ids".to_sym
    rename_table(user_storage_ids_dashboard, user_storage_ids_pegasus)
    DCDO.set('user_storage_ids_in_dashboard', false)
  end
end
