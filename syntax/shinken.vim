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


" Groups detection

syntax match  shinkenDefineBlock       "^define.*"
            \ contains=shinkenDaemon,shinkenObjectType,shinkenDefine,shinkenOtherObjects
            \ transparent

syntax keyword  shinkenDefine       contained
            \ define

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

syntax keyword  shinkenOtherObjects contained
            \ module
            \ source
            \ realm

syntax match    shinkenObjectKeyBlock
            \ "^[ \t]\+\h\+[ \t]\+"
            \ contains=shinkenObjectKey,shinkenDaemonConfKey,shinkenMacro,shinkenData,shinkenOtherKeys
            \ transparent

syntax keyword  shinkenObjectKey contained
            \ active_checks_enabled
            \ address
            \ aggregation
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
            \ contactgroups
            \ contact_groups
            \ contact_name
            \ contactgroup_name
            \ contacts
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
            \ template_members
            \ thursday
            \ timeout
            \ timeperiod_name
            \ tuesday
            \ use
            \ view_contact_groups
            \ view_contacts
            \ wednesday

syntax keyword  shinkenDaemonConfKey
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

syntax match    shinkenComment "#.*"
syntax match    shinkenComment ";.*$"
syntax match    shinkenComment "^[\t ]\+_SE_UUID.*"

syntax match    shinkenMacro    "$\w\+\$"
syntax match    shinkenData     "^[ \t]\+\zs_\h\+\ze"

syntax match    shinkenString   '"[^"]*"'


" Highlighting
highlight link shinkenDefine        Operator
highlight link shinkenObjectType    Function
highlight link shinkenDaemon        Function
highlight link shinkenOtherObjects  Function
highlight link shinkenObjectKey     Identifier
highlight link shinkenDaemonConfKey Identifier
highlight link shinkenOtherKeys     Identifier
highlight link shinkenComment       Comment
highlight link shinkenMacro         Macro
highlight link shinkenData          Macro
highlight link shinkenString        String


let &cpo = s:cpo_save
unlet s:cpo_save
