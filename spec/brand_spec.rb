require('spec_helper')

describe(Brand) do
  it("validates presence of name") do
    brand = Brand.new({:name => ""})
    expect(brand.save()).to(eq(false))
  end

  it("converts the name to titlecase") do
    brand = Brand.create({:name => "nike"})
    expect(brand.name()).to(eq("Nike"))
  end
end
