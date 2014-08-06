RSpec::Matchers.define :be_a_json_with_pagination_represenation_of do |results|
  match do |json|
    scope = results.keys.first
    scoped_results = Kaminari.paginate_array(results[scope]).page(1)
    serializer = (scope.to_s.singularize.classify + 'Serializer').constantize

    expected = CollectionSerializer.new(
      scoped_results,
      each_serializer: serializer,
      root: scope,
      serializer_includes: results[:serializer_includes]
    )

    expect(json.to_json).to be_json_eql(expected.to_json)
  end
end
