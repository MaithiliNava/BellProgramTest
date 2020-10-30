using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using RaiseTicket.Models;

namespace RaiseTicket.Controllers
{
    public class TicketsController : Controller
    {
        private BellFieldServiceEntities db = new BellFieldServiceEntities();

        
        public ActionResult GridView()
        {
            var tickets = db.Tickets.Include(t => t.Department).Include(t => t.Employee).Include(t => t.Project);
            return View(tickets.ToList());
        }

        public ActionResult DrawChart()
        {
            var ticketCount = db.Tickets.Include(t => t.Project)
                              .GroupBy(p => new { p.Project.ProjectName })
                              .Select(r => new ProjectTicket
                              {
                                  ProjectName = r.Key.ProjectName,
                                  TicketCount = r.Count()
                              }).OrderByDescending(r => r.TicketCount).ToList();

            return View(ticketCount.ToList());
        }

       
        // GET: Tickets/Create
        public ActionResult Create()
        {
            ViewBag.DeptId = new SelectList(db.Departments, "DeptId", "DeptName");
            ViewBag.EmpIoyeeId = new SelectList(db.Employees, "EmployeeId", "EmpName");
            ViewBag.ProjectId = new SelectList(db.Projects, "ProjectId", "ProjectName");
            return View();
        }

        public JsonResult GetEmployees(string DeparmentId)
        {
            var EmpList = db.Employees.Where(e => e.DeptId.ToString() == DeparmentId).Select(e => new EmployeeVM
            {
                EmployeeId = e.EmployeeId,
                EmpName = e.EmpName                
            }).ToList();

            return Json(EmpList, JsonRequestBehavior.AllowGet);
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TicketId,ProjectId,DeptId,EmpIoyeeId,Description,Null")] Ticket ticket)
        {
            if (ModelState.IsValid)
            {
                db.Tickets.Add(ticket);
                db.SaveChanges();
                return RedirectToAction("GridView");
            }

            ViewBag.DeptId = new SelectList(db.Departments, "DeptId", "DeptName", ticket.DeptId);
            ViewBag.EmpIoyeeId = new SelectList(db.Employees, "EmployeeId", "EmpName", ticket.EmpIoyeeId);
            ViewBag.ProjectId = new SelectList(db.Projects, "ProjectId", "ProjectName", ticket.ProjectId);
            return View(ticket);
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
