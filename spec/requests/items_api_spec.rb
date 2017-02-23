require "rails_helper"

describe "Items API" do
  it "can return all items" do
     get '/api/v1/items'

    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items).to be_an(Array)

    item = items.first
    expect(item).to be_a(Hash)
    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("image_url")
    expect(item).to_not have_key("created_at")
    expect(item).to_not have_key("updated_at")
  end
end
