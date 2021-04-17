# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def serialize(collection, adapter = :json, serializer: nil)
    if collection.is_a?(Array)
      serializer = collection.first.class
    else
      serializer = collection.class
    end
    return [] if collection.is_a?(Array) && collection&.empty?


    ActiveModelSerializers::SerializableResource.new(
      collection,
      each_serializer: serializer,
      adapter: adapter
    ).as_json
  end
end
