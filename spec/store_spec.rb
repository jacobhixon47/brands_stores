require('spec_helper')

describe(Store) do
  it("validates presence of name") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
  end

  it("converts the name to titlecase") do
    store = Store.create({:name => "happy feet"})
    expect(store.name()).to(eq("Happy Feet"))
  end
end
