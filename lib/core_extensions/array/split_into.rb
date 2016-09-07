module CoreExtensions
  module Array
    module SplitInto
      def split_into(num_arrays)
        if (num_arrays == 0) || (self.size == 0)
          empty_arrays = []
          num_arrays.times { empty_arrays << [] }

          return empty_arrays
        end

        slice_size = (self.size/Float(num_arrays)).ceil
        slices = self.each_slice(slice_size).to_a

        # return empty arrays up to num_arrays instead of no arrays
        return slices if slices.length == num_arrays

        (num_arrays - slices.length).times do
          slices << []
        end

        slices
      end

      def round_robin_split_into(num_arrays)
        self_copy = self.clone
        if (num_arrays == 0) || (self_copy.size == 0)
          empty_arrays = []
          num_arrays.times { empty_arrays << [] }

          return empty_arrays
        end

        result = [ ]
        num_arrays.times {|x| result << []}

        until self_copy.size == 0 do
          result.each do |arr|
            if item = self_copy.shift
              arr << item
            end
          end
        end

        result
      end
    end
  end
end