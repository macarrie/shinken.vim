if !exists("main_syntax")
        if version < 600
            syntax clear
        elseif exists("b:current_syntax")
            finish
        endif
        let b:current_syntax = "shinken"
endif

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim


" Cfg syntax
""""""""""""""""""""""""""""""
syntax match cfgKey ".*="me=e-1

highlight link cfgKey Keyword


" Shinken objects syntax
""""""""""""""""""""""""""""""
syntax match    shinkenObjectPropertyDefinition "^\s*\zs\h\+\ze\s*.\+"
            \ contained
            \ contains=shinkenObjectKey,shinkenDaemonConfKey,shinkenOtherKeys

syntax match    shinkenMacro    "$\w\+\$"
syntax match    shinkenData     "^\s*\zs_\h\+\ze"

syntax match    shinkenComment "^\s*#.*"
syntax match    shinkenComment ";.*$" contained
syntax match    shinkenComment "^\s*_SE_UUID.*" contained

syntax region   shinkenString   start=+"+ end=+"+ contains=shinkenMacro

syntax match    shinkenDefine       "^define\s*\h\+"
            \ contains=shinkenDaemon,shinkenObjectType,shinkenDefine,shinkenOtherObjects

syntax region   shinkenDefinitionBlock
            \ start=/define.*{/hs=e+1
            \ end=/}/
            \ contains=shinkenDefine,shinkenObjectPropertyDefinition,shinkenData,shinkenComment
            \ transparent
            \ fold

syntax keyword  shinkenObjectType contained
            \ businessimpactmodulation
            \ command
            \ contact
            \ contactgroup
            \ escalation
            \ host
            \ hostgroup
            \ macromodulation
            \ notificationway
            \ resultmodulation
            \ service
            \ timeperiod

syntax keyword  shinkenDaemon contained
            \ arbiter
            \ broker
            \ poller
            \ reactionner
            \ receiver
            \ scheduler
            \ synchronizer

syntax keyword  shinkenOtherObjectsTypes contained
            \ module
            \ source
            \ realm

syntax keyword  shinkenObjectKey contained
            \ acl_force_result_check
            \ acl_force_retry_check
            \ acl_in_tab_history
            \ acl_make_acknowledge
            \ acl_make_downtime
            \ acl_share_everybody
            \ acl_share_group
            \ acl_share_private
            \ acl_show_history_range
            \ acl_show_sla_range
            \ acl_try_check_on_poller
            \ acl_try_check_on_synchronizer
            \ active_checks_enabled
            \ address
            \ aggregation
            \ apply_on_type
            \ business_impact
            \ business_impact_modulation_name
            \ business_impact_modulations
            \ can_submit_commands
            \ check_command
            \ check_freshness
            \ check_interval
            \ check_period
            \ check_running_timeout
            \ command_line
            \ command_name
            \ contact_groups
            \ contact_name
            \ contactgroup_name
            \ contactgroups
            \ contacts
            \ default_submit_to_staging
            \ default_value
            \ definition_order
            \ display_name
            \ duplicate_foreach
            \ edition_contact_groups
            \ edition_contacts
            \ email
            \ enabled
            \ escalation_name
            \ escalation_options
            \ escalation_period
            \ escalations
            \ event_handler
            \ event_handler_enabled
            \ expert
            \ first_notification_delay
            \ first_notification_time
            \ flap_detection_enabled
            \ flap_detection_options
            \ for_all_users
            \ freshness_threshold
            \ friday
            \ high_flap_threshold
            \ host_name
            \ host_notification_commands
            \ host_notification_options
            \ host_notification_period
            \ host_notifications_enabled
            \ hostgroup_name
            \ hostgroups
            \ is_admin
            \ is_volatile
            \ last_notification_time
            \ low_flap_threshold
            \ macromodulation_name
            \ macromodulations
            \ maintenance_period
            \ max_check_attempts
            \ members
            \ min_business_impact
            \ modulation_period
            \ monday
            \ name
            \ notes_multi_url
            \ notes_url
            \ notification_contact_groups
            \ notification_contacts
            \ notification_interval
            \ notification_options
            \ notification_period
            \ notifications_enabled
            \ notificationway_name
            \ notificationways
            \ output_rules
            \ pack
            \ pager
            \ parents
            \ passive_checks_enabled
            \ password
            \ poller_tag
            \ process_perf_data
            \ reactionner_tag
            \ realm
            \ register
            \ resultmodulation_name
            \ resultmodulations
            \ retry_interval
            \ saturday
            \ service_description
            \ service_excludes
            \ service_notification_commands
            \ service_notification_options
            \ service_notification_period
            \ service_notifications_enabled
            \ sunday
            \ synchronizer_internal_description
            \ template_members
            \ thursday
            \ timeout
            \ timeperiod_name
            \ tuesday
            \ use
            \ view_contact_groups
            \ view_contacts
            \ warning_threshold_cpu_usage
            \ wednesday

syntax keyword  shinkenDaemonConfKey contained
            \ address
            \ arbiter_name
            \ broker_name
            \ check_interval
            \ data_timeout
            \ direct_routing
            \ exec_stat_range
            \ keep_timeout_time
            \ manage_arbiters
            \ manage_sub_realms
            \ max_check_attempts
            \ min_workers
            \ modules
            \ passive
            \ poller_name
            \ poller_tags
            \ polling_interval
            \ port
            \ processes_by_worker
            \ reactionner_name
            \ realm
            \ receiver_name
            \ satellitemap
            \ scheduler_name
            \ sources
            \ spare
            \ synchronizer_name
            \ taggers
            \ timeout
            \ use_ssl

syntax keyword  shinkenOtherKeys
            \ cfg_path
            \ description
            \ import_interval
            \ module_type
            \ order
            \ source_name
            \ realm_name

" Highlighting
highlight  link  shinkenDefine         Operator
highlight  link  shinkenObjectType     Function
highlight  link  shinkenDaemon         Function
highlight  link  shinkenObjectType     Function

highlight  link  shinkenObjectKey      Identifier
highlight  link  shinkenDaemonConfKey  Identifier
highlight  link  shinkenOtherKeys      Identifier

highlight  link  shinkenComment        Comment
highlight  link  shinkenMacro          Macro
highlight  link  shinkenData           Macro
highlight  link  shinkenString         String


let &cpo = s:cpo_save
unlet s:cpo_save
