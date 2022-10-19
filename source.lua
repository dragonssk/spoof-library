getgenv().spoof = function(instance, property)
    local spoofer = {
        enabled = true,
        fake = instance[property],
        fake_type = typeof(fake),
    }

    local _index
    local _newindex

    function spoofer:SetFake(new_value, any_type)
        if any_type then
            spoofer.fake = new_value
        elseif typeof(new_value) == spoofer.fake_type then
            spoofer.fake = new_value
        else
            spoofer.fake = nil
        end
    end

    function spoofer:Destroy()
        instance[property] = spoofer.fake
        spoofer.enabled = false
    end

    _index = hookmetamethod(instance, '__index', function(self, index)
        if self == instance and index == property and not checkcaller() and spoofer.enabled then
            return spoofer.fake
        end

        return _index(self, index)
    end)

    _newindex = hookmetamethod(instance, '__newindex', function(self, index, value)
        if self == instance and index == property and not checkcaller() and spoofer.enabled then
            if typeof(value) == spoofer.fake_type then
                spoofer.fake = value
                return
            else
                spoofer.fake = nil
                return
            end
        end

        return _newindex(self, index, value)
    end)

    return spoofer
end
