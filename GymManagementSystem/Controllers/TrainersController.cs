using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using GymManagementSystem.Models;

namespace GymManagementSystem.Controllers
{
    public class TrainersController : Controller
    {
        private GymManagementSystemDBEntities db = new GymManagementSystemDBEntities();

        // GET: Trainers
        public ActionResult Index()
        {
            return View(db.Trainers.ToList());
        }

        // GET: Trainers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Trainers trainers = db.Trainers.Find(id);
            if (trainers == null)
            {
                return HttpNotFound();
            }
            return View(trainers);
        }

        // GET: Trainers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Trainers/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TrainerID,FirstName,LastName,Email,PhoneNumber,HireDate")] Trainers trainers)
        {
            if (ModelState.IsValid)
            {
                db.Trainers.Add(trainers);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(trainers);
        }

        // GET: Trainers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Trainers trainers = db.Trainers.Find(id);
            if (trainers == null)
            {
                return HttpNotFound();
            }
            return View(trainers);
        }

        // POST: Trainers/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TrainerID,FirstName,LastName,Email,PhoneNumber,HireDate")] Trainers trainers)
        {
            if (ModelState.IsValid)
            {
                db.Entry(trainers).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(trainers);
        }

        // GET: Trainers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Trainers trainers = db.Trainers.Find(id);
            if (trainers == null)
            {
                return HttpNotFound();
            }
            return View(trainers);
        }

        // POST: Trainers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Trainers trainers = db.Trainers.Find(id);
            db.Trainers.Remove(trainers);
            db.SaveChanges();
            return RedirectToAction("Index");
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
