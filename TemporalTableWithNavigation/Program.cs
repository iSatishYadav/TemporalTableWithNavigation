using Microsoft.EntityFrameworkCore;
using TemporalTableWithNavigation;

var options = new DbContextOptionsBuilder<TemporaltablewithnavigationContext>()
    .UseSqlServer("Database=localhost;User Id=sa;Password=P@ssw0rd")
    .Options;
var context = new TemporaltablewithnavigationContext(options);

var entityWithoutNavigation = context.Employees.Include(x => x.Status).ToList();
var entityWithNavigation = context.Employees.TemporalAll().Include(x => x.Status).ToList();