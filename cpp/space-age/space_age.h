#if !defined(SPACE_AGE_H)
#define SPACE_AGE_H

namespace space_age {

    class space_age {
    private:
        unsigned long seconds_on_earth;
        float earth_age;

    public:
        space_age(unsigned long seconds) {
             seconds_on_earth = seconds;
             earth_age = (float)seconds_on_earth / 31557600;
        };

        int seconds() const { return seconds_on_earth; }

        float on_earth() const { return earth_age; }

        float on_mercury() const { return earth_age / 0.2408467; }

        float on_venus() const { return earth_age / 0.61519726; }

        float on_mars() const { return earth_age / 1.8808158; }

        float on_jupiter() const { return earth_age / 11.862615; }

        float on_saturn() const { return earth_age / 29.447498; }

        float on_uranus() const { return earth_age / 84.016846; }

        float on_neptune() const { return earth_age / 164.79132; }
    };
}

#endif