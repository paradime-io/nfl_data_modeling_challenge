import ephem
import datetime

start_date_str = "2023-09-01"
end_date_str = "2024-10-01"

start_date = ephem.Date(datetime.datetime.strptime(start_date_str, "%Y-%m-%d"))
# Add one day to make end_date exclusive
end_date = ephem.Date(datetime.datetime.strptime(end_date_str, "%Y-%m-%d") + datetime.timedelta(days=1))

phase_functions = {
    "New Moon": ephem.next_new_moon,
    "First Quarter": ephem.next_first_quarter_moon,
    "Full Moon": ephem.next_full_moon,
    "Last Quarter": ephem.next_last_quarter_moon,
}

filename = "moon_phases_23_24.csv"

with open(filename, "w") as f:
    f.write("moon_phase,date,time\n")
    
    current_date = start_date
    while current_date < end_date:
        events = [(p, phase_functions[p](current_date)) for p in phase_functions]
        events.sort(key=lambda x: x[1])
        
        next_phase, next_time = events[0]
        
        if next_time >= end_date:
            break
        
        dt = ephem.Date(next_time).datetime()  # UTC
        date_str = dt.strftime("%Y-%m-%d")
        time_str = dt.strftime("%H:%M")
        
        f.write(f"{next_phase},{date_str},{time_str}\n")
        
        current_date = next_time + ephem.minute
