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
    public class SubscriptionsController : Controller
    {
        private GymManagementSystemDBEntities db = new GymManagementSystemDBEntities();

        // GET: Subscriptions
        public ActionResult Index()
        {
            var subscriptions = db.Subscriptions.Include(s => s.Members);
            return View(subscriptions.ToList());
        }

        // GET: Subscriptions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Subscriptions subscriptions = db.Subscriptions.Find(id);
            if (subscriptions == null)
            {
                return HttpNotFound();
            }
            return View(subscriptions);
        }

        // GET: Subscriptions/Create
        public ActionResult Create()
        {
            ViewBag.MemberID = new SelectList(db.Members, "MemberID", "FirstName");
            return View();
        }

        // POST: Subscriptions/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SubscriptionID,MemberID,SubscriptionType,StartDate,EndDate")] Subscriptions subscriptions)
        {
            if (ModelState.IsValid)
            {
                db.Subscriptions.Add(subscriptions);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MemberID = new SelectList(db.Members, "MemberID", "FirstName", subscriptions.MemberID);
            return View(subscriptions);
        }

        // GET: Subscriptions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Subscriptions subscriptions = db.Subscriptions.Find(id);
            if (subscriptions == null)
            {
                return HttpNotFound();
            }
            ViewBag.MemberID = new SelectList(db.Members, "MemberID", "FirstName", subscriptions.MemberID);
            return View(subscriptions);
        }

        // POST: Subscriptions/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SubscriptionID,MemberID,SubscriptionType,StartDate,EndDate")] Subscriptions subscriptions)
        {
            if (ModelState.IsValid)
            {
                db.Entry(subscriptions).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MemberID = new SelectList(db.Members, "MemberID", "FirstName", subscriptions.MemberID);
            return View(subscriptions);
        }

        // GET: Subscriptions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Subscriptions subscriptions = db.Subscriptions.Find(id);
            if (subscriptions == null)
            {
                return HttpNotFound();
            }
            return View(subscriptions);
        }

        // POST: Subscriptions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Subscriptions subscriptions = db.Subscriptions.Find(id);
            db.Subscriptions.Remove(subscriptions);
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
