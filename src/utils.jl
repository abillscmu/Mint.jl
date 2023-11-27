function full_clean(override_prompt=false)
    if !(override_prompt)
        @warn "this will delete all databases and cause the permanent loss of all personal finance data. are you sure you would like to continue?" 
        yn = readline(stdin)
        if yn == "y"
            delete = true
        else
            delete = false
        end
    else
        delete = true
    end
    if delete
        @info "deleting the database..."
        rm("assets/mint_jl.db")
    else
        @info "clean cancelled. nothing changed"
    end
end