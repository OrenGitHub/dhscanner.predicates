% fixture : utils/types/php/eloquent.pl ( facts only, no kb )

must(utils_method_of_class_return_type('where', 'Illuminate.Database.Eloquent.Model', 'Illuminate.Database.Eloquent.Builder')).
must(utils_method_of_class_return_type('where', 'Illuminate.Foundation.Auth.User', 'Illuminate.Database.Eloquent.Builder')).

% update runs the query, it returns no Builder
must_not(utils_method_of_class_return_type('update', 'Illuminate.Database.Eloquent.Model', _)).
