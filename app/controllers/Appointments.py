from system.core.controller import *
import datetime

class Appointments(Controller):
    def __init__(self, action):
        super(Appointments, self).__init__(action)
        self.load_model('Appointment')
        self.load_model('User')

    def index(self):
    	return redirect('/users/dashboard')

    def match(self):
        info = {
            'id': session['id']
        }
        buddy_id = self.models['Appointment'].get_buddy_id(info)
        if session['id'] == buddy_id[0]['buddy']:
            buddy = buddy_id[0]['linkedin_user_id']    
        else:
            buddy = buddy_id[0]['buddy']
        buddy_info = {
            'user_id': buddy
        }
        buddy_user = self.models['Appointment'].get_user_info(buddy_info)

        if session['id'] == buddy_id[0]['buddy']:
            buddy_checkers = {
                'user_id': buddy_id[0]['linkedin_user_id']
            }
            buddy_check = self.models['Appointment'].get_user(buddy_checkers)
        else:
            buddy_checkers = {
                'buddy_id': buddy_id[0]['buddy'] 
            } 
            buddy_check = self.models['Appointment'].get_buddy(buddy_checkers)
        
        
        return self.load_view('/appointments/match.html', buddy_user=buddy_user[0], buddy_check=buddy_check)

    def add(self):

        if request.form['topic_new']:
            topic = request.form['topic_new']
            a = {
                'topic': topic
            }
            topic_check = self.models['Appointment'].get_topic_by_name(a)
            if topic_check:
                print "topic already exists"
            else:
                self.models['Appointment'].add_topic(a)
    	else:
    		topic = request.form['topic']

    	if request.form['location_new']:
            location = request.form['location_new']
            b = {
                'location': location
            }
            location_check = self.models['Appointment'].get_location_by_name(b)
            if location_check:
                print "location already exists"
            else:
                self.models['Appointment'].add_location(b)
    	else:
    		location = request.form['location']

    	topic_info = {
    		'topic': topic
    	}
    	topic_id = self.models['Appointment'].get_topic_id(topic_info)

        location_info = {
            'location': location
        }
        location_id = self.models['Appointment'].get_location_id(location_info)
        date = datetime.date.today()
        add_id = {
            'user_id': session['id']
        }
        get = self.models['Appointment'].get_aplist(add_id)
        if get:
            date2 = get[0]['created_at']
            if date2 == date:
                flash('You are already on the list for today')
            return self.load_view('partials/flash.html')
            # return redirect('/users/dashboard')
        else:
            buddy_info = {
                'buddy_id': session['id']
            }
            buddy_check = self.models['Appointment'].get_buddy(buddy_info)
            if not buddy_check:
                info = {
                    'id': session['id'],
                    'topic_id': topic_id[0]['id'],
                    'location': location_id[0]['id'],
                }
                add_status = self.models['Appointment'].add_appointment(info)
                if add_status['status'] == True:
                    # return redirect('/users/dashboard')
                    return ''
                else:
                    for message in add_status['errors']:
                        flash(message)
                    # return redirect('/users/dashboard')
                    return self.load_view('partials/flash.html')
            else:
                flash('You are already on the list for today')
                # return redirect('/users/dashboard')
                return self.load_view('partials/flash.html')

    def delete(self, id):
        delete_id = id
        info = {
            'id': delete_id
        }
        self.models['Appointment'].delete_appointment(info)
        availables = self.models['Appointment'].get_availables()
        return redirect('/users/dashboard')

    def buddy(self, id):
    	user_id = id
        buddy_id = session['id']
        availables = self.models['Appointment'].get_availables()
        user_info = {
            'user_id': user_id
        }
        user_check = self.models['Appointment'].get_user(user_info)
        buddy_info = {
            'buddy_id': buddy_id
        }
        buddy_check = self.models['Appointment'].get_buddy(buddy_info)

        if user_id == buddy_id:
            flash('You cannot eat with yourself!')
            return redirect('/users/dashboard')
        else:
            info = {
                'buddy_id': buddy_id,
                'user_id': user_id
            }
            self.models['Appointment'].add_buddy(info)

        info_check = {
            'user_id': buddy_id
        }
        get_user = self.models['Appointment'].get_user(info_check)
        print get_user
        if get_user:
            info2 = {
                'buddy_id': user_id,
                'user_id': buddy_id
            }
            self.models['Appointment'].add_buddy(info2)
            return redirect('/appointments/match')
        else:
            info3 = {
                'id': user_id
            }
            get_buddy_info = self.models['Appointment'].get_buddy_info(info3)
            topic = get_buddy_info[0]['topic_id']
            location = get_buddy_info[0]['location_id']
            full_info = {
                'buddy_id': user_id,
                'id': buddy_id,
                'topic_id': topic,
                'location': location
            }
            get_user = self.models['Appointment'].add_full_appointment(full_info)
            return redirect('/appointments/match')

    def get_availables(self):
        availables = self.models['Appointment'].get_availables()
        return self.load_view('partials/appointment.html', availables=availables)

    def get_flash(self):
        return self.load_view('partials/flash.html')

    def get_appointments(self):
        return self.load_view('partials/conversation.html')
