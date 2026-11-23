% fixture : utils/api.pl ( facts only, no kb )

% the leaves are reached through the family api
must(utils_method_of_class_return_type('where', 'Illuminate.Database.Eloquent.Model', _)).

must_not(utils_method_of_class_return_type('where', 'Illuminate.Database.Eloquent.Builder', _)).
