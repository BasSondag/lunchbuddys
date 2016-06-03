
from system.core.router import routes

#user routes
routes['default_controller'] = 'Users'
routes['/users/auth'] = 'Users#auth'
routes['/users/logout'] = 'Users#logout'
routes['/users/dashboard'] = 'Users#dashboard'
routes['/users/callback'] = 'Users#callback'
routes['/users/get_info'] = 'Users#get_info'
routes['/users/create'] = 'Users#create'
routes['/users/profile'] = 'Users#profile'
routes['/code'] = "Users#code"

# routes for apointments
routes['POST']['/users/add'] = 'Users#add_to_aplist'
routes['/appointments/get_availables'] = 'Appointments#get_availables'
routes['/appointments/get_flash'] = 'Appointments#get_flash'
routes['/appointments/get_appointments'] = 'Appointments#get_appointments'


#appointment routes
routes['/appointments'] = 'Appointments#index'
routes['/appointments/match'] = 'Appointments#match'
routes['POST']['/appointments/form'] = 'Appointments#form'
routes['POST']['/appointments/add'] = "Appointments#add"
routes['POST']['/appointments/buddy/<id>'] = 'Appointments#buddy'
routes['POST']['/appointments/delete/<id>'] = 'Appointments#delete'