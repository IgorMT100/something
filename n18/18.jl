function along_recursive!(robot,side) # №18
    if !isborder(robot,side)
        move!(robot,side)
        alongg(robot,side)
    end
end