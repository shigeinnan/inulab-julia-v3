using Pkg

function main()
    if isempty(Pkg.Registry.reachable_registries())
        Pkg.Registry.add(Pkg.RegistrySpec(name="General"))
    end # 追加
    Pkg.add(
        Pkg.PackageSpec[
            Pkg.PackageSpec(name="Distributions"),
            Pkg.PackageSpec(name="HiGHS", version="1.12.2"),
            Pkg.PackageSpec(name="IntervalArithmetic", version="0.22.19"),
            Pkg.PackageSpec(name="JuMP"),
            Pkg.PackageSpec(name="LaTeXStrings"),
            Pkg.PackageSpec(name="Plots"),
            Pkg.PackageSpec(name="PyPlot"),
            Pkg.PackageSpec(name="StatsPlots"),
            Pkg.PackageSpec(name="Ipopt", version="1.6.7")
        ]
    )
    Pkg.precompile()
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
