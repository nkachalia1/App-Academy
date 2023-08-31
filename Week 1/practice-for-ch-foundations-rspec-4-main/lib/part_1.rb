def my_reject(arr, &prc)
    new_arr = []
    arr.each do |ele|
        if !prc.call(ele)
            new_arr << ele
        end
    end

    new_arr
end

def my_one?(arr, &prc)
    count = 0

    arr.each do |ele|
        if prc.call(ele)
            count += 1
        end
    end

    if count == 1
        return true
    else
        return false
    end
end

def hash_select(hash, &prc)
    new_Hash = {}
    hash.each do |k, v|
        if prc.call(k, v)
            new_Hash[k] = v
        end
    end

    new_Hash
end

def xor_select(arr, proc_1, proc_2)
    new_arr = []
    arr.each do |ele|
        if (proc_1.call(ele) and !proc_2.call(ele)) or (!proc_1.call(ele) and proc_2.call(ele))
            new_arr << ele
        end
    end

    new_arr
end

def proc_count(num, arr)
    count = 0
    arr.each do |proc|
        if proc.call(num)
            count += 1
        end
    end

    count
end
