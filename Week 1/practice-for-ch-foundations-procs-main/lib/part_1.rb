def my_map(array, &prc)
    mapped = []

    array.each do |element|
        mapped << prc.call(element)
    end

    mapped
end

def my_select(array, &prc)
    selected = []

    array.each do |element|
        if prc.call(element)
            selected << element
        end
    end

    selected
end

def my_count(array, &prc)
    count = 0
    array.each do |element|
        if prc.call(element)
            count +=1
        end
    end

    count
end

def my_any?(array, &prc)
    array.each do |element|
        if prc.call(element)
            return true
        end
    end
    return false
end

def my_all?(array, &prc)
    array.each do |element|
        if prc.call(element) == false
            return false
        end
    end
    return true
end

def my_none?(array, &prc)
    array.each do |element|
        if prc.call(element)
            return false
        end
    end
    return true
end
