module ActiveRecord
  module JSONB
    module Associations
      module BelongsToAssociation #:nodoc:
        def replace_keys(record)
          return super unless reflection.options.key?(:store)

          owner[reflection.options[:store]][reflection.foreign_key] =
            record ? record._read_attribute(
              reflection.association_primary_key(record.class)
            ) : nil
        end
      end
    end
  end
end
