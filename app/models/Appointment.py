
from system.core.model import Model

class Appointment(Model):
    def __init__(self):
        super(Appointment, self).__init__()


#appointment methods
    def get_all_locations(self):
    	get_all_locations_query = "SELECT location FROM locations"
    	query = self.db.query_db(get_all_locations_query)
    	return query

    def add_appointment(self, info):
        location = info['location']
        topic = info['topic_id']
        errors = []
        if not location:
            errors.append('You need to select a location')
        if not topic:
            errors.append('You need to select a topic')
        if errors:
            return {'status': False, 'errors': errors}
        else:
            add_appointment_query = "INSERT INTO appointments (topic_id, linkedin_user_id, location_id, created_at, updated_at) VALUES(:topic_id, :id, :location, NOW(), NOW())"
            add_appointment_data = {'topic_id': info['topic_id'], 'id': info['id'], 'location': info['location']}
            self.db.query_db(add_appointment_query, add_appointment_data)
            return {'status': True}

    def add_full_appointment(self, info):
        add_appointment_query = "INSERT INTO appointments (topic_id, linkedin_user_id, buddy, location_id, created_at, updated_at) VALUES(:topic_id, :id, :buddy_id, :location, NOW(), NOW())"
        add_appointment_data = {'topic_id': info['topic_id'], 'id': info['id'], 'buddy_id': info['buddy_id'], 'location': info['location']}
        return self.db.query_db(add_appointment_query, add_appointment_data)

    def delete_appointment(self, info):
        delete_appointment_query = "DELETE FROM appointments WHERE linkedin_user_id= :linkedin_user_id"
        delete_appointment_data = {'linkedin_user_id': info['id']}
        return self.db.query_db(delete_appointment_query, delete_appointment_data)

    def get_all_appointments(self):
        query = "SELECT DISTINCT topic, location, appointments.created_at FROM appointments JOIN topics ON topics.id = appointments.topic_id JOIN locations ON locations.id = appointments.location_id WHERE appointments.buddy IS NOT NULL AND appointments.created_at = CURDATE()"
        return self.db.query_db(query)

    def get_availables(self):
    	query = 'SELECT linkedin_users.name, linkedin_users.headline, linkedin_users.industry, locations.location, appointments.linkedin_user_id, topics.topic FROM linkedin_users JOIN appointments ON linkedin_users.id = appointments.linkedin_user_id JOIN topics ON topics.id = appointments.topic_id JOIN locations ON locations.id = appointments.location_id WHERE appointments.buddy IS NULL AND appointments.created_at = CURDATE()'
        x = self.db.query_db(query)
    	return x

    def get_aplist(self,info):
        select_query = "SELECT * FROM appointments WHERE linkedin_user_id = :linkedin_user_id AND appointments.created_at = CURDATE()"
        data = {'linkedin_user_id': info['user_id']}
        x = self.db.query_db(select_query,data)
        return x

    def get_user_info(self, info):
        get_user_query = "SELECT * FROM linkedin_users WHERE id = :user_id"
        get_user_data = {'user_id': info['user_id']}
        return self.db.query_db(get_user_query, get_user_data)

    def get_user(self, info):
        get_user_query = "SELECT linkedin_user_id FROM appointments WHERE linkedin_user_id = :linkedin_user_id"
        get_user_data = {'linkedin_user_id': info['user_id']}
        return self.db.query_db(get_user_query, get_user_data)

    def get_buddy(self, info):
        get_buddy_query = "SELECT buddy FROM appointments WHERE buddy = :buddy AND appointments.created_at = CURDATE()"
        get_buddy_data = {'buddy': info['buddy_id']}
        return self.db.query_db(get_buddy_query, get_buddy_data)

    def add_buddy(self, info):
        add_buddy_query = "UPDATE appointments SET buddy = :buddy WHERE linkedin_user_id = :linkedin_user_id AND created_at = CURDATE()"
        add_buddy_data = {'buddy': info['buddy_id'], 'linkedin_user_id': info['user_id']}
        return self.db.query_db(add_buddy_query, add_buddy_data)

    def get_buddy_id(self, info):
        get_buddy_id_query = "SELECT buddy, linkedin_user_id FROM appointments JOIN linkedin_users ON appointments.buddy = linkedin_users.id WHERE linkedin_user_id = :linkedin_user_id AND appointments.updated_at > CURDATE() OR buddy = :buddy AND appointments.updated_at > CURDATE()"
        get_buddy_id_data = {'linkedin_user_id': info['id'], 'buddy': info['id']}
        return self.db.query_db(get_buddy_id_query, get_buddy_id_data)

    def get_buddy_info(self, info):
        get_buddy_query = "SELECT * FROM appointments WHERE linkedin_user_id = :linkedin_user_id AND appointments.updated_at > CURDATE()"
        get_buddy_data = {'linkedin_user_id': info['id']}
        data = self.db.query_db(get_buddy_query, get_buddy_data)
        if data.length > 0:
            return data
        else:
            get_buddy_query = "SELECT * FROM appointments WHERE buddy = :buddy AND appointments.updated_at > CURDATE()"
            get_buddy_data = {'buddy': info['id']}
            return self.db.query_db(get_buddy_query, get_buddy_data)

#topic methods
    def get_topic_id(self, info):
    	query = "SELECT id from topics WHERE topic= :topic"
    	data = {'topic': info['topic']}
    	return self.db.query_db(query, data)

    def add_topic(self, info):
    	query = "INSERT INTO topics (topic, created_at, updated_at) VALUES(:topic, NOW(), NOW())"
    	data = {'topic': info['topic']}
    	return self.db.query_db(query, data)

    def get_all_topics(self):
    	query = "SELECT topic from topics"
    	return self.db.query_db(query)

    def get_topic_by_name(self, info):
        query = "SELECT * FROM topics WHERE topic= :topic"
        data = {'topic': info['topic']}
        return self.db.query_db(query, data)

#location methods
    def add_location(self, info):
        query = "INSERT INTO locations (location, created_at, updated_at) VALUES(:location, NOW(), NOW())"
        data = {'location': info['location']}
        return self.db.query_db(query, data)

    def get_location_by_name(self, info):
        query = "SELECT * FROM locations WHERE location= :location"
        data = {'location': info['location']}
        return self.db.query_db(query, data)

    def get_all_locations(self):
        query = "SELECT * FROM locations"
        return self.db.query_db(query)


    def get_location_id(self, info):
        query = "SELECT id from locations WHERE location= :location"
        data = {'location': info['location']}
        return self.db.query_db(query, data)
