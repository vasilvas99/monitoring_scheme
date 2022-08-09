function get_interstep_distances(step_positions::Vector{Float64})
    # all distances are normalized to the initial vicinal distance $l_0$
    n = length(step_positions)
    step_distances = zeros(n)
    for i in 2:n
        step_distances[i] = step_positions[i] - step_positions[i-1]
    end
    step_distances[1] = step_positions[1] - step_positions[n] + n
    return step_distances
end

function find_bunches(step_distances::Vector{Float64}, bunch_def: Float64)

end

function ms1(step_positions::Vector{Float64})
    step_distances = get_interstep_distances(step_positions)

end

function main()
    a = [1., 2., 3., 4.,5., 6., 7., 8., 9.]
    println(get_interstep_distances(a))
end

main()