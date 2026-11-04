% fixture : sinks/db/php/yii.pl

% Yii::app()->db->createCommand( $sql )->queryAll()
kb_call_resolved(startloc_30_17_endloc_30_80_protected_slash_controllers_slash_SiteController_dot_php, 'Yii.app.db.createCommand.queryAll').
% Yii::app()->db->createCommand( $sql ) : building the command, not running it
kb_call_resolved(startloc_31_17_endloc_31_60_protected_slash_controllers_slash_SiteController_dot_php, 'Yii.app.db.createCommand').
% $command->queryAll() on an unresolved receiver
kb_call_resolved(startloc_32_17_endloc_32_40_protected_slash_controllers_slash_SiteController_dot_php, 'Unknown.queryAll').

must(sinks_sqli_php_yii(startloc_30_17_endloc_30_80_protected_slash_controllers_slash_SiteController_dot_php)).
% wired into the family api
must(sinks_sqli(startloc_30_17_endloc_30_80_protected_slash_controllers_slash_SiteController_dot_php)).

must_not(sinks_sqli_php_yii(startloc_31_17_endloc_31_60_protected_slash_controllers_slash_SiteController_dot_php)).
must_not(sinks_sqli_php_yii(startloc_32_17_endloc_32_40_protected_slash_controllers_slash_SiteController_dot_php)).
must_not(sinks_sqli(startloc_31_17_endloc_31_60_protected_slash_controllers_slash_SiteController_dot_php)).
