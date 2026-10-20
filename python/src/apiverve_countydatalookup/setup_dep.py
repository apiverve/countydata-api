from setuptools import setup, find_packages

setup(
    name='apiverve_countydatalookup',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='County Data Lookup is a county lookup API that retrieves income, poverty rate, and life expectancy for any US county by state and county name. Paid plans add age demographics, educational attainment, health indicators, ZIP codes, and cost of living.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/countydata?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
