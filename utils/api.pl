:- style_check(-singleton).

% -----------------------------------------------------------------------------
% Domain knowledge of 3rd party code : facts about libraries the scanned code
% calls but does not contain, so the kb cannot say them ( a library method's
% return type, ... ). Written by hand, one leaf per language / library.
% -----------------------------------------------------------------------------

:- [ 'predicates/utils/types/php/eloquent' ].
