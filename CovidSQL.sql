-- SELECT *
-- FROM coviddeaths1
-- ORDER BY 3,4;

-- SELECT *
-- FROM covidvaccinations
-- ORDER BY 3,4

-- SELECT Location, date, total_cases, new_cases, total_deaths, population
-- FROM coviddeaths1
-- ORDER BY 1,2 

-- SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)
-- FROM coviddeaths1
-- ORDER BY 1,2

-- SELECT Location, date, total_cases, total_deaths, (total_deaths/ total_cases)*100 as DeathPercentage
-- FROM coviddeaths1
-- order by 1,2

-- SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Deathpercentage
-- FROM coviddeaths1
-- WHERE location like '%africa%'
-- order by 1,2

-- SELECT Location, date, total_cases, population, (total_cases/population)*100 as Deathpercentage
-- FROM coviddeaths1
-- WHERE location like '%africa%'
-- order by 1,2

-- SELECT Location, Population, MAX(total_cases) as HighestInfectionCount, Max(total_cases/population)*100 as PercentPopulationInfeceted
-- FROM coviddeaths1
-- WHERE location like '%africa%'
-- GROUP BY Location, Population
-- ORDER BY PercentPopulationInfeceted desc

-- SELECT Location, MAX(Total_deaths) TotalDeathCount
-- FROM coviddeaths1
-- WHERE continent is not null
-- -- WHERE location like '%africa%'
-- GROUP BY Location
-- ORDER BY TotalDeathCount desc

-- SELECT continent, MAX(Total_deaths) TotalDeathCount
-- FROM coviddeaths1
-- -- WHERE location like '%africa%'
-- WHERE continent is not null
-- GROUP BY continent
-- ORDER BY TotalDeathCount desc

-- SELECT SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
-- FROM coviddeaths1
-- -- WHERE Location like '%Africa%'
-- WHERE continent is not null
-- -- GROUP BY date
-- order by 1.2

-- SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(vac.new_vaccinations) OVER(Partition by dea.Location Order by dea.location, dea.date) as RollingPeopleVaccinated
-- -- (RollingPeopleVaccinated/population)*100
-- FROM coviddeaths1 dea
-- Join covidvaccinations vac
-- 	ON dea.location = vac.location
--     AND dea.date = vac.date
-- WHERE dea.continent is not null
-- ORDER BY 2,3
-- )
-- SELECT *
-- FROM PopvsVAC

-- With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
-- as
-- (
-- SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(vac.new_vaccinations) OVER(Partition by dea.Location Order by dea.location, dea.date) as RollingPeopleVaccinated 
-- -- (RollingPeopleVaccinated/population)*100
-- FROM coviddeaths1 dea
-- Join covidvaccinations vac
-- 	ON dea.location = vac.location
--     AND dea.date = vac.date
-- WHERE dea.continent is not null
-- -- ORDER BY 2,3
-- )
-- SELECT *, (RollingPeopleVaccinated/Population)*100
-- FROM PopvsVAC

-- CREATE VIEW Percentage as
-- SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(vac.new_vaccinations) OVER(Partition by dea.Location Order by dea.location, dea.date) as RollingPeopleVaccinated 
-- -- (RollingPeopleVaccinated/population)*100
-- FROM coviddeaths1 dea
-- Join covidvaccinations vac
-- 	ON dea.location = vac.location
--     AND dea.date = vac.date
-- WHERE dea.continent is not null;
-- -- ORDER BY 2,3


-- SELECT *
-- FROM Percentage
