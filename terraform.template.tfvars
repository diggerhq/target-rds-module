db_name = {{ db_name }}
rds_engine = {{ rds_engine }}
aws_app_identifier = {{ aws_app_identifier }}
{{ 'allocated_storage="' + allocated_storage + '"' if allocated_storage is defined else '' }}
{{ 'storage_type="' + storage_type + '"' if storage_type is defined  else '' }}
{{ 'engine="' + engine + '"' if engine is defined  else '' }}
{{ 'ingress_port="' + ingress_port + '"' if ingress_port is defined  else '' }}
{{ 'connection_schema="' + connection_schema + '"' if connection_schema is defined  else '' }}
{{ 'engine_version="' + engine_version + '"' if engine_version is defined  else '' }}
{{ 'instance_class="' + instance_class + '"' if instance_class is defined  else '' }}
{{ 'database_name="' + database_name + '"' if database_name is defined  else '' }}
{{ 'database_username="' + database_username + '"' if database_username is defined  else '' }}
{{ 'publicly_accessible="' + publicly_accessible + '"' if publicly_accessible is defined  else '' }}
{{ 'snapshot_identifier="' + snapshot_identifier + '"' if snapshot_identifier is defined  else '' }}
{{ 'vpc_id="' + vpc_id + '"' if vpc_id is defined  else '' }}
{{ 'private_subnets="' + private_subnets + '"' if private_subnets is defined  else '' }}
{{ 'security_groups="' + security_groups + '"' if security_groups is defined  else '' }}
