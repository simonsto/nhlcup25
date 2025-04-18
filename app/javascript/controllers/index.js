// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import BracketController from "./bracket_controller"
application.register("bracket", BracketController)

eagerLoadControllersFrom("controllers", application)
